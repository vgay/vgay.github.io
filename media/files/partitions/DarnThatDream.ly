\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"


\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 10)
                            (minimum-distance . 10)
                            (padding . 2))
}

title = #"Darn That Dream"
composer = #"Jimmy Van Heusen"
meter = #"(Ballad)"
kwtempo = #"Mod. Slow"
kwstyle = #"Ballad"

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
  \set chordChanges = ##f
  g2:7+ bes4:m7 es:7 a2:m7 b:7.11+ e4:m7 e:m7/d a:7/cis c:m7 b2:m5-7 e:7
  a:m7 f:7 b:m7 bes:m7 a:m7 d:7 b4:m7 e:7 a:m7 d:7
  g2:6 f4:m7 bes:7
  es2:7+ c:m7 f:m7 bes:7 g:m7 fis4:m7 b:7 f2:m7 bes:7
  es2:7+ c:m7 a4:m5-7 d:7 g2:m7 a:m7 d:7 bes4:m7 es:7 a:m7 d:7
  g2:7+ bes4:m7 es:7 a2:m7 b:7.11+ e4:m7 e:m7/d a:7/cis c:m7 b2:m5-7 e:7
  a:m7 f:7 b:m7 bes:m7 a:m7 d:7  g1:6
}


theNotes =  \relative c' {
  \clef "treble" \key g \major \time 4/4
  % \partial 8
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 {
    \mark #1 d4 g es4. es8 | e!4 a f4. fis8 |
    g4 b gis8 a b c | d4 e b2 |
    b4 d c8 b a g | fis4 a f es |  d2 fis |
  }
  \alternative {
    { d1 }
    { g2. r4 }
  }
  \mark #2 \bar "||" \break
  r8 g4 g8 f4 es | c' c bes4. c8 |
  \tuplet 3/2 { d4 es d } cis b | bes as f2 | \break
  r8 g4 g8 f4 es | g a bes4. c8 |
  d8 d d d~ d4 d, | bes'2 b \bar "||" \break
  \mark #1 d,4 g es4. es8 | e!4 a f4. fis8 |
  g4 b gis8 a b c | d4 e b2 | \break
  b4 d c8 b a g | fis4 a f es | d2 b' | g2. r4
  \bar ".."
}
mus = \chordmode {
  \mark #1
  g2:7+ bes4:m7 es:7
  a2:m7 b:7.11+
  e4:m7 e:m7/d a:7/cis c:m7
  b2:m5-7 e:7
  \break
  a:m7 f:7
  b:m7 bes:m7
  a:m7 d:7
  \set Score.repeatCommands = #'((volta "1.") )
  b4:m7 e:7 a:m7 d:7
  \set Score.repeatCommands = #'((volta #f) end-repeat)
  \break
  \stopStaff s1 \bar "" s \bar "" s \startStaff
  \set Score.repeatCommands = #'((volta "2.") )
  g2:6 f4:m7 bes:7
  \set Score.repeatCommands = #'((volta #f))
  \break \bar "||" \mark #2
  es2:7+ c:m7
  f:m7 bes:7
  g:m7 fis4:m7 b:7
  f2:m7 bes:7
  \break
  es2:7+ c:m7
  a4:m5-7 d:7 g2:m7
  a:m7 d:7
  bes4:m7 es:7 a:m7 d:7
  \break \bar "||" \mark #1
  g2:7+ bes4:m7 es:7
  a2:m7 b:7.11+
  e4:m7 e:m7/d a:7/cis c:m7
  b2:m5-7 e:7
  \break
  a:m7 f:7
  b:m7 bes:m7
  a:m7 d:7
  g1:6
  \bar ".."
}

verse = \lyricmode {
  Darn that dream
  I dream each night
  You say you love me and hold me tight
  But when I a -- wake and you're out of sight
  Oh, darn that dream \repeat unfold 3 { \skip 1 }

  Darn that one track mind of mine
  It can't un -- der -- stand that you don't care
  Just to change the mood I'm in
  I'd wel -- come a nice old night -- mare

  Darn that dream
  And bless it too
  With -- out that dream I ne -- ver would have you
  But it haunts me and it won't come true
  Oh, darn that dream
}
verseB = \lyricmode {
  Darn your lips and darn your eyes
  They lift me high a -- bove the moon -- lit skies
  Then I tum -- ble out of pa -- ra -- dise \repeat unfold 3 { \skip 1 }
  Oh, darn that dream
}
grille = \chordmode {
  \bar "[|:" \wa g2:7+ bes4:m7 es:7 \/a2:m7 b:7.11+ \x e4:m7 e:m/d a:7/cis c:m7 \/b2:m5-7 e:7 \break
  \/a2:m7 f:7 \/b:m7 bes:m7 \/a:m7 b:7 \set Score.repeatCommands = #'((volta "1.") )
  \xa b4:m7 e:7 a:m7 d:7 \set Score.repeatCommands = #'((volta #f) end-repeat) \break
  \stopStaff s1 \bar "" s \bar "" s \startStaff \set Score.repeatCommands = #'((volta "2.") )
  \w g2:7+ f4:m7 bes:7 \set Score.repeatCommands = #'((volta #f)) \bar "||" \break
  \/es2:7+ c:m7 \/f:m7 bes:7 \w g:m7 fis4:m7 b:7 \/f2:m7 bes:7 \break
  \/es:7+ c:m7 \y a4:m5-7 d:7 g2:m7 \/a:m7 g:7 \x bes4:m7 es:7 a:m7 d:7  \bar "||" \break
  \wa g2:7+ bes4:m7 es:7 \/a2:m7 b:7.11+ \x e4:m7 e:m/d a:7/cis c:m7 \/b2:m5-7 e:7 \break
  \/a2:m7 f:7 \/b:m7 bes:m7 \/a:m7 b:7 g1:6


  \bar ".." }

marques = \relative c' {
  s1 ^\markup \bold \box \fontsize #5 A s1*11
  s1 ^\markup \bold \box \fontsize #5 B s1*7
  s1 ^\markup \bold \box \fontsize #5 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
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
    page-count = #1
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
    page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
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
    %}  \bookpart {
    \score {
      \layout {
        indent = 0
        \context {
          \Score
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
        \context {
          \ChordGrid
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Percent_repeat_engraver"
        }
      }
      \new ChordGrid \mus
    }
} }

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
    %}  \bookpart {
     \score {
      \layout {
        indent = 0
        \context {
          \Score
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
        \context {
          \ChordGrid
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Percent_repeat_engraver"
        }
      }
      \new ChordGrid \transpose c d \mus
    }
 } }

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
          \transpose c a \theNotes
        >>
      >>
    } %\form
    %}  \bookpart {
    \score {
      \layout {
        indent = 0
        \context {
          \Score
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
        \context {
          \ChordGrid
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Percent_repeat_engraver"
        }
      }
      \new ChordGrid \transpose c a \mus
    }
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    system-system-spacing = #'((basic-distance . 18)
                               (minimum-distance . 12)
                               (padding . 0))
  }
  #(define output-suffix "Vocala4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
          \addlyrics \verse
          \addlyrics \verseB
        >>
      >>

    }
}}