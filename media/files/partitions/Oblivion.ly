\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Oblivion"
composer = #"Astor Piazzolla"
meter = #"(Slow Tango)"
kwtempo = #"Mod. Slow"
kwstyle = #"Tango"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  %asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    %voltaSpannerDuration = #(ly:make-moment 4 4)
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
    \override MultiMeasureRest #'expand-limit = #3
    %     \override NonMusicalPaperColumn #'line-break-permission = ##f
    %     \override NonMusicalPaperColumn #'page-break-permission = ##f
    % à remplacer par \autoLineBreaksOff et \autoBreaksOff
  }
  \context {
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score markFormatter = #format-mark-box-alphabet }
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}

\defineBarLine "||-[|:" #'("||" "[|:" "[|:")

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  c1:m c:m c:m c:m f2:m7 bes:7 es:7+ aes:7+ d:m5-7 d:7 g:sus4 g:7
  c1:m c:m c:m c:m bes:m6/g c:9- f:m f:m7/es
  f:m6/d g2:7 g8:7 d4.:dim7 c1:m c:m7/bes d:7/a g:7 c:m c:m
  f:m7 bes:7 es:7+ f:m7/aes d:m5-7 g2:9- g:7 c4.:m f:m/c c4:m/es
  e1:dim7 f:m7 bes:7 es:7+ aes d:7 g c:m c:m
  c1:m c:m c:m c:m f2:m7 bes:7 es:7+ aes:7+ d:m5-7 d:7 g:sus4 g:7
  c1:m c:m c:m c:m bes:m6/g c:9- f:m f:m7/es
  f:m6/d g2:7 g8:7 d4.:dim7 c1:m c:m7/bes d:7/a g:7 c1:m c1:m
}
harmoniesRS = \chordmode {
  \set chordChanges = ##t
  c1:m c:m c:m c:m f2:m7 bes:7 es:7+ aes:7+ d:m5-7 d:7 g:sus4 g:7
  c1:m c:m c:m c:m bes:m6/g c:9- f:m f:m7/es
  f:m6/d g2:7 g8:7 d4.:dim7 c1:m c:m7/bes d:7/a g:7 c:m c:m
  f:m7 bes:7 es:7+ f:m7/aes d:m5-7 g2:9- g:7 c4.:m f:m/c c4:m/es
  e1:dim7 f:m7 bes:7 es:7+ aes d:7 g c:m c:m
  c1:m
}


theNotes =  \relative c' {
  \clef "treble" \key es \major \time 4/4
  \key es \major
  \mark #1 g''1  ~ | \tuplet 3/2 { g4 f es  } d4. c8 |   % 3
  es1 ~ | es4. d16 c bes4. as8 |    % 5
  c2. bes16 c bes as | bes4. c8 ~ c bes as g |   % 7
  as4. g16 f es4 d | g2 ~ g8 g as16 g fis! g \bar "||" \break   % 9
  g'1 ~ | \tuplet 3/2 { g4 f es  } d8. c16 d es d c |   % 11
  es1 ~ | es4 d8 c bes4. as8 |
  c2. bes16 c bes as | bes4. des!8 ~ des c4. |   % 15
  bes as16 bes as2 ~ | as r4 \tuplet 3/2 { es'8 f g  } \bar "||"  \break  % 17
  as4. g16 f as2 | r8 g bes16 as g f ~ f4. es16 f |   % 19
  es8 c ~ c2. | r2 f8. es16 ~ es8 d16 c |    % 21
  fis,!2. ~ fis8 fis | g2 as8 g4 fis!16 g |   % 23
  c1 ~ | c \bar "||" \break   % 25
  \mark #2 es2. c8 d | \tuplet 3/2 { es4 d f  } bes, as |   % 27
  g d'2. ~ | \tuplet 3/2 { d4 c es  } as, g |   % 29
  f c'2. ~ | \tuplet 3/2 { c4 b! d  } g, f |   % 31
  es4. f8 ~ f4 g  | g2. as16 g ges g \bar "||" \break   % 33
  es'2. c8 d | \tuplet 3/2 { es4 d f  } bes, as |   % 35
  g d'2. ~ | \tuplet 3/2 { d4 c es  } as, g |    % 37
  fis!1 | g2. ~ g8 g |   % 39
  c1 ~ | c2 r2 \bar "||"  \break
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup { \column { \line { \pad-around #0.5 " "} \line { "Possible solos here on AB"} }}
  \markup { \column { \line { \pad-around #2 " "} \line { \box "Last Head"} }}
  g'1  ~ | \tuplet 3/2 { g4 f es  } d4. c8 |   % 43
  es1 ~ | es8 d f es d c4 bes16 as |    % 45
  c2. bes16 c bes as | bes2 c8 bes4 as16 g |   % 47
  as4. g16 f es4 d | g2. r8 g16 as  \bar "||" \break  % 49
  g'1 ~ | \tuplet 3/2 { g4 f es  } d8 c d16 c b! c |   % 51
  es1 | r8 d f16 es d c bes8 as4 g16 as |   % 53
  c4. bes8 ~ bes2 | as8 g4. f g8 |   % 55
  bes as16 g as2. ~ | as2 r4 r16 c f g  \bar "||" \break  % 57
  bes4. as16 g as2 | r8 g bes16 as g f g f es d c d es f |   % 59
  g8 c,4 c8 ~ c2 ~ | c f8 es4 d16 c |    % 61
  fis,!2. ~ fis8 fis | g2 as8 g4 fis!16 g |  \break % 63
  c1 | r8 g as c d es f g |   % 65
  r g, as c d es f g | r g, as c d es f g |   % 67
  c1 ~ | c4 r r2
  \bar ".."
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

Basse = \relative c' {
  \clef "bass" \key es \major \time 4/4 \mark #1
  c1 | c |   % 3
  c | c |   % 5
  f,4. f'8 bes,4 bes | es,4. es'8 as,4 as |   % 7
  d,4. d'8 d,4 bes' | g4. g8 g4 d |  \bar "||" \break
  c4. c'8 c4 c, | c4. c'8 c4 c, |   % 11
  c4. c'8 c4 c, | c4. c'8 c4 c, |   % 13
  g'4. g8 g2 | c,4. c'8 c4 c, |   % 15
  f4. f'8 f4 f, | es'4. f,8 f4 es' |   \bar "||" \break
  d4. f,8 f4 d' | g,4. g'8 g4 d |   % 19
  c4. c,8 c4 c' | bes4. c,8 c4 bes' |   % 21
  a!4. d,8 d4 a' | g4. g8 g4 d |  \toCoda
  c1 | c \bar "||"   \break
  f4. c'8 c4 f, | bes4. bes8 bes4 f |   % 27
  es4. es8 es4 bes' | as4. as8 as4 f |   % 29
  d4. d8 d4 d' | g,4. g8 g4 g |   % 31
  c,4. c8 c4 es | e!4. e8 e4 e |  \bar "||"   \break
  f4. f8 f4 f | bes4. bes8 bes4 f |   % 35
  es4. es8 es4 bes' | as4. as8 as4 f |   % 37
  d4. d'8 d4 d, | g4. g'8 g4 g, |   % 39
  c, c'2 c4 | c, c'2 c4 \bar "||" \break
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup { \right-column { \line { \pad-around #0.5 " "} \line { "Possible solos on AB"} \line { \with-color #red \musicglyph "Then D.C. al Coda"}}}
  \markup { \column { \line { \pad-around #2 " "} \line {\with-color #red \musicglyph "scripts.varcoda" } }}

  c,2. c'4 | bes2. bes4 |   % 65
  as2. as4 | g2. g4 |   % 67
  c,1 ~ | c4 r r2
  \bar ".."
}

PianoD = \relative c' {
  \key es \major
  \mark #1
  r8 g as c d es f4 | r8 g, as c d es f4 |   % 3
  r8 g, as c d es f4 | r8 g, as c d es f4 | % 5
  as2 as | g g |   % 7
  f ges | g es4 d \bar "||" \break   % 9
  r8 g, as c d es f4 | r8 g, as c d es f4 |   % 11
  r8 g, as c d es f4 | r8 g, as c d es f4 |    % 13
  f g e f | as2 g |   % 15
  r4 d es f | g4. f16 es d4 c \bar "||" \break   % 17
  f g2 f4 | as g2 f4 |   % 19
  es1 | g4 f2 es4 |   % 21
  d es2 d4 | d es2 d4 |   % 23
  \toCoda < c es g > 4.< c es as > 8~ < c es as > 4< c es g > | < c es bes' > 4.< c es as > 8~ < c es as > 4< c es g > \bar "||" \break   % 25
  \mark #2
  < as' c es > 2.< f c' > 8< g d' > | \tuplet 3/2 { < as es' > 4< g d' > < bes f' >  } < g bes > < f as > |   % 27
  < d g > < g d' > 2.~ | \tuplet 3/2 { < g d' > 4< f c' > < f es' >  } < es as > < d g > |   % 29
  < c f > < f c' > 2.~ | \tuplet 3/2 { < f c' > 4< as b! > < as d >  } < f g > < d f > |   % 31
  < c es > 4.< d f > 8~ < d f > 4< es g > | < e! g > 2.as16 g ges! g! |   % 33
  < as c es > 2.< f c' > 8< g d' > | \tuplet 3/2 { < as es' > 4< g d' > < bes f' >  } < g bes > < f as > |   % 35
  < d g > < g d' > 2.~ | \tuplet 3/2 { < g d' > 4< f c' > < f es' >  } < es as > < d g > |   % 37
  < c fis! > 1| < b! g' > |   % 39
  < c es g > 4.< c es as > 8~ < c es as > 4< c es g > | < c es bes' > 4.< c es as >8 ~ < c es as >4 < c es g > \bar "|." \break
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup { \right-column {\line { \pad-around #1 "Possible solos on AB"} \line { \with-color #red "Then D.C. al Coda"}}}
  \markup { \column { \line { \pad-around #2 " "} \line {\with-color #red \musicglyph "scripts.varcoda" } }}
  r8 g as c d es f4 | r8 g, as c d es f4 |   % 65
  r8 g, as c d es f4 | r8 g, as c d es f4 |   % 67
  < c es > 1~ | < c es > 4r r2
  \bar "|."
}

PianoG = \relative c {
  \key es \major
  \clef bass
  c1 | c |   % 3
  c | c |   % 5
  r8 es' d es r es d4 | r8 d c d r d c d |   % 7
  r d c d r d c d | r c d b! ~ < f b > 2|   % 9

  < g, c > 4.< c g' > 8~ < c g' > 2| < g c > f'4 es |   % 11
  < as, d > 4.< g c > 8~ < g c > 2~ | < g c > < c es > |   % 13
  %d4. c8 ~ c2 ~ | c es |   % 13
  < des! bes' des! > 2.f!4 | < e! bes' des! > 2< e! bes' des! > |   % 15
  < f as c > 1| < f as c > 2f4 g |
  < as c > 2.g4 | < f b! d > 2.< d as' b! > 4|   % 19
  < es g c > 1| < g c > 2.bes4 |   % 21
  < fis! c' > 1| < f b! > |   % 23
  c,4 c'2. | c,4 c'2.  % 25
  < es as >2. as8 bes | \tuplet 3/2 { c4 bes d  } g, f |   % 27
  bes, < d g > 2.~ | \tuplet 3/2 { < d g > 4< f as > 2 } < c g' > |   % 29
  as4 < c f > 2.~ | \tuplet 3/2 { < c f > 4< f as > 2 } b,! |   % 31
  g4. as8 ~ as4 < g c > | < bes des! > 2.r4 |   % 33
  < es as > 2.as8 bes | \tuplet 3/2 { c4 bes d  } g, f |   % 35
  bes, < d g > 2.~ | \tuplet 3/2 { < d g > 4< f as > 2 } < c g' > |   % 37
  < as c > 1| < b! d f > |   % 39
  c,4 c'2. | c,4 c'2.
  c2. c4 | bes2. bes4 |   % 65
  as2. as4 | g2. g4 |   % 67
  g1 ~ | g4 r r2

}


grille = \chordmode {
  \bar "[|:"
  \repeat percent 4 { c1:m } \break
  \/ f2:m7 bes:7 \/es:7+ as:7+ \/d:m5-7 d:7 \/g:sus4 g:7 \break
  \repeat percent 4 { c1:m } \break
  bes:m6/g c:9- f:m f:m7/es \break
  f:m6/d  \v g2.:7 d4:dim7 c1:m c:m7/bes \break
  d:7/a g:7 \repeat percent 2 { c:m }
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \toCoda
  f:m7 bes:7 es:7+ f:m7/aes \break
  d:m5-7 g:9- \w c2:m f4:m/c d:m/es e1:dim7
  f:m7 bes:7 es:7+ as:7+ \break
  d:7 g \repeat percent 2 { c:m } \break \bar "|."
  \Coda \repeat percent 4 { c:m }

  \bar ".." }

marques = \relative c' {
  s1 ^\markup \bold \box \fontsize #5 A s1*23
  s1 ^\markup \bold \box \fontsize #5 B
}


\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a, \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )
          \override ParenthesesItem.extra-offset = #'(10 . -1 )
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
    }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )
          \override ParenthesesItem.extra-offset = #'(10 . -1 )
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c d \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a, \theNotes
        >>
      >>
    } %\form
    }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )
          \override ParenthesesItem.extra-offset = #'(10 . -1 )
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c a \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BassTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmoniesRS }
        \new Staff \with { instrumentName = \CleFa } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \Basse
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Bassa4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmoniesRS }
        \new Staff \with { instrumentName = \CleFa }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \Basse
        >>
      >>
    } %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )
          \override ParenthesesItem.extra-offset = #'(10 . -1 )
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \grille
      >>
} } }

\book {
 \paper { #(set-paper-size "a4")}
\bookpart {
  #(define output-suffix "Pianoa4")
  \score {
    <<
      \new ChordNames { \harmoniesRS }
      \new PianoStaff \with { instrumentName = Piano } <<
        \new Staff \PianoD
        \new Staff { \clef "bass" \PianoG }
    >> >>
  } %\form
}  \bookpart {
  \score {
    \layout {
      indent = 0
      ragged-right = ##f
      ragged-last = ##f
      \context {
        \Score
        \remove "Volta_engraver"
        \omit Clef % Cacher la clef
        \omit TimeSignature % cacher la métrique
        \omit BarNumber
        \override SpacingSpanner.strict-note-spacing = ##t
        proportionalNotationDuration = #(ly:make-moment 1/16)
      }
    }
    <<
      \new Staff \with {
        \remove "Staff_symbol_engraver"
      }
      \marques
      \new ChordNames \with {
        \override ChordName.extra-offset = #'(10 . -1 )
        \override ParenthesesItem.extra-offset = #'(10 . -1 )
        \override BarLine.bar-extent = #'(-5 . 5)
        \consists "Bar_engraver"
        \override StaffSymbol.line-positions = #'( -10 10 )
        \consists "Staff_symbol_engraver"
        \consists "Percent_repeat_engraver"
        \consists "Volta_engraver"
      }
      \grille
    >>
} } }

\book {
  \paper { %page-count = #2
	#(set-paper-size "tablette")}
   \bookpart {
    #(define output-suffix "PianoTab")
  \score {
    <<
      \new ChordNames { \harmoniesRS }
      \new PianoStaff \with { instrumentName = Piano } <<
        \new Staff \PianoD
        \new Staff { \clef "bass" \PianoG }
    >> >>
  } %\form
} }