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

title = #"Belleville Rendez-vous"
composer = #"Ben Charest"
meter = #"(Up swing)"
kwtempo = #"Fast"
kwstyle = #"Swing"
kwfrench = #"oui"

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
  \repeat unfold 4 { a2:m6 e:7/b a:m/c e:7/b }
  a2:m6 e:7/b g:7 des:7 c1:6 b2:7 bes:7
  \repeat unfold 2 { a1:m6 bes:5-7 } a1:m6 f2:7 e:7 a2:m6 e:7/b a:m/c e:7/b
  a1*16:m6
}


theNotes =  \relative c'' {
  \clef "treble" \key c \major \time 4/4
  % \partial 8
  \showStartRepeatBar \bar "[|:" \mark \markup \box Intro
  \repeat volta 2 { c4-. 4-. 8 a fis e | c4. b'8 r4. b8 | c4-. 4-. 8 a fis e | c b b' a r4. b8  }
  \break \mark #1
  \repeat volta 2 {
    e4 4 4 4 | d c a c | \scoop e1 | r2 r4. b8 |\break
    e4 4 4 4 | d c a8 c r8 8~ | 2 r | r r4. a8 \break
    c4 4 4 4 | bes2 r | c4 4 4 4 | bes2 r |\break
    c4 4 4 4 | b! a e gis | a2 r | R1
  }
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
\break \mark \markup { \box B \smaller "(Refrain)" }
  a4 a a e | a a \scoop c2~ | 1 | r2 r4. a8 |
  a4 a a e | a4 8 8~ 2 | R1 | r2 r4. a8| \break
  a4 a a e | a a \scoop c2~ | 1 | r2 r4. a8 |
  a4 a a e | \scoop a2. \scoop a4~ | 2.  \scoop a4~ | 1

  \bar ".."
}

verse = \lyricmode {
  \repeat unfold 19 { \skip 1 }
  J'veux pas fi -- nir mes jours à Tom -- bouc -- tou
La peau ti -- rée par des ma -- chines à clous
Moi je veux être fri -- pée
Tri -- ple -- ment fri -- pée
Fri -- pée comme une Tri -- plette de belle -- ville
Swin -- ging Belle -- ville ren -- dez -- vous
Ma -- ra -- thon dan -- cing doop dee doop
Vau -- dou Can -- can ba -- lais ta -- boo __
Au Belle -- ville swin -- ging ren -- dez -- vous
}



grille = \chordmode {
  \repeat volta 2 {
    \repeat unfold 2 { \/a2:m6 e:7/b \/a:m/c e:7/b } \break
    \/a2:m6 e:7/b \/g:7 des:7 c1:6 \/b2:7 bes:7 \break
    \repeat unfold 2 { a1:m6 bes:5-7 }  \break
    a:m6 \/f2:7 e:7 \/a:m6 e:7/b \/a:m/c e:7/b \break }
  \repeat volta 2 { \repeat percent 4 { a1:m6 } }
  \mark \markup 4X
 }

marques = \relative c' {
  s1 ^\markup \bold \box \fontsize #5 A s1*15
  s1 ^\markup \bold \box \fontsize #5 B
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
    %}  \bookpart {
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
    %}  \bookpart {
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
          \transpose c a \theNotes
        >>
      >>
    } %\form
    %}  \bookpart {
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
  \paper { page-count = #1
           #(set-paper-size "a4")}
  \bookpart {
    #(define output-suffix "Vocala4")
    \score {
      <<
        \new ChordNames {
          \harmonies
        }
        \new Staff
        <<
          \set Staff.instrumentName = \CleSol
          \new Voice = "Mel" { \theNotes \pageBreak }
          \addlyrics \verse
          \\ { \repeat unfold 8 { \voiceTwo s1*4 \break  } }
        >>

      >>

    }

   \markup {
      \vspace #5
      \fill-line {
        \hspace #1
        \column {
          \line { 2- }
          \line { J'veux pas finir ma vie à Singapour }
          \line { Jouer au dico manger des petits fours }
          \line { Moi j'veux être zidiote Triplement zidiote  }
          \line { Gondolée comme une Triplette de Belleville  }
          \hspace #2
          \line { J'veux pas finir ma vie à Honolulu }
          \line { Chanter comme un zoiseau ça n'se fait plus }
          \line { Je veux ma voix brisée Triplement brisée  }
          \line { Swinguer comme une Triplette de Belleville }
        \hspace #2
          \line { (Refrain) }
        }
        \hspace #2
        \column {
          \line { 3- }
          \line { J'veux pas finir ma vie à Constantinople }
          \line { C'est bien trop dur de faire des rimes en “nople“ }
          \line { Je veux être givrée (Hop!) Triplement Givrée (Hop Hop!)  }
          \line { La quadrature des Triplettes de Belleville }
          \hspace #2
          \line { J'pourrai finir ma vie à Katmandou }
          \line { C'est bien plus doux de faire des rimes en “dou“ }
          \line { Mais je veux être givrée Complètement Givrée }
          \line { Et swinguer comme les Tripletes de Belleville }
          \hspace #2
          \line { (Refrain + Solo + Refrain) }
        }
        \hspace #1
      }
    }
} }