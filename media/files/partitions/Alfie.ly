\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "Bass_changes_equal_root.ly"



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

title = #"Alfie"
composer = #"Burt Bacharach"
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
  \set chordChanges = ##t

  c1:7+  g:7sus4 c:7+ e2:m7 a:9-
  d1:m7 e2:m7 a:7 d2:m7 g:7sus4

  c1:dim7 g:7sus4 g2:7 g:5+7
  c1:dim7
  b1:m7 c4:m7 c:m7/bes a2:m7  b1:m7 a2:m7 d:7 b1:m7 c4:m7 c:m7/bes a2:m
  g1:7sus4 g2:7 g:5+7
  c1:7+ g:7sus4 fis2:m5-7 f:7 e:m7 a:m7 fis:m5-7 f:7 e:m7 a:m7
  d1:11+ d2:m7 g:7sus4 c1:dim7 g:7sus4 c1:9- d:m5-7/c c:9- c:7+
}


theNotes =  \relative c'' {
  \clef "treble" \key c \major \time 4/4
  \mark #1
  \repeat volta 2 {
    g16 f e f g2. | f8 c'4.~ c4 g8 a | g4 c,8 b' a b,4 c8 | d2 r4 e8 g \break
    e' c c4~ c8 d16 c b8 c | d g, g4 r2 | a8 d, e4 f8 g a4 }
  \alternative {
    { a8 d b2 c4 | a8 d, e4 f8 g a4~ | a a a2 }
    { a8 d b2 r8 c \bar "||" }} \mark #2
  \break d4. b8 fis4 g | es2 d8 e \tuplet 3/2 { g b d } | e4. b8 b2 | r2 r4. d,8 \break
  d'4. b8 \tuplet 3/2 { fis4 a g } | es2 d8 e g b |
  c4. b8 c4 b | b4. a8 b4 a \bar "||" \break \mark #1
  g16 f e f g2. | f8 c'4.~ c2 |
  r8 a b c d, c d' c | g2 r8 d' c4 | \break
  r8 a b c d, c d' c | g4. a8 b c4. |
  d4 e2. \fermata | a,8 d, e4 f8 g a4 | \break
  a8 d b2 c4 | a8 d, e4 f8 g a4 | a8 g g2. | R1 | a8 g g2. | R1 \fermata
  \bar ".."
}

verse = \lyricmode {
What's it all a -- bout, Al -- fie __
Is it just for the mo -- ment we live
What's it all a -- bout when you sort it out, Al -- fie
Are we meant to take more than we give
Or are we meant to be kind
And if \repeat unfold 4 { \skip 1 }

sure as I be -- lieve there's a hea -- ven a -- bove, Al -- fie
I know there's some -- thing much more
Some -- thing e -- ven non be -- lie -- vers can be -- lieve in
I be -- lieve in love, Al -- fie __
Wi -- thout true love we just ex -- ist, Al -- fie
Un -- til you find the love you've missed you're no -- thing, Al -- fie
When you walk let your heart lead the way
And you'll find love any day, Al -- fie, Al -- fie
}

verseB = \lyricmode {
  on -- ly fools are kind, Al -- fie __
Then I guess it is wise to be cruel
And if life be -- longs on -- ly to the strong, Al -- fie
"What will" you lend on an old \repeat unfold 12 { \skip 1 }gol -- den rule As
}


grille = \chordmode {
  \set chordChanges = ##t

  \bar "[|:" c1:7+  g:7sus4 c:7+ \/e2:m7 a:9- \break
  d1:m7 \/e2:m7 a:7 \/d2:m7 g:7sus \set Score.repeatCommands = #'((volta "1.") )
  c1:dim7 \break \set Score.repeatCommands = #'((volta #f)) d:m7 \s g2:7 g:5+7
  \bar ":|]"
  \stopStaff s1 \startStaff \set Score.repeatCommands = #'((volta "2.") )
  c1:dim7 \break \set Score.repeatCommands = #'((volta #f)) \bar "||"
  b:m7 \y c4:m7 c:m7/bes a2:m7  b1:m7 \/a2:m7 d:7 \break
  b1:m7 \y c4:m7 c:m7/bes a2:m7 g1:7sus4 \/g2:7 g:5+7 \break \bar "||"
  c1:7+  g:7sus4 \/fis2:m5-7 f:7 \/e:m7 a:7 \break
  \/fis2:m5-7 f:7 \/e:m7 a:7 d1:9.11+ \/ d2:m7 g:7sus4 \break
  c1:dim7 g:7sus4 c:9- d:m5-7/c \break
  c:9- c:7+ \bar ".." \stopStaff s \bar "" s \bar ""
}

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
        \new ChordNames \with { \consists #Bass_changes_equal_root_engraver } \harmonies
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
        \new ChordNames \with { \consists #Bass_changes_equal_root_engraver }
        \transpose c d \harmonies
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
        \new ChordNames \with { \consists #Bass_changes_equal_root_engraver }
        \transpose c a \harmonies
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
    %page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames \with { \consists #Bass_changes_equal_root_engraver } \harmonies
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
          \consists #Bass_changes_equal_root_engraver
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
        \new ChordNames \with { \consists #Bass_changes_equal_root_engraver }
        \transpose c d \harmonies
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
          \consists #Bass_changes_equal_root_engraver
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
        \new ChordNames \with { \consists #Bass_changes_equal_root_engraver }
        \transpose c a \harmonies
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotes
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
          \consists #Bass_changes_equal_root_engraver
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
  \paper { page-count = #1
           #(set-paper-size "a4")}
  \bookpart {
    #(define output-suffix "Vocala4")
    \score {
      <<
        \new ChordNames \with { \consists #Bass_changes_equal_root_engraver } \harmonies
        \new Staff <<
          \new Voice = m \theNotes
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
    }
} }